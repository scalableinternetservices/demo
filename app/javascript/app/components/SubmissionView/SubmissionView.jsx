import { useMutation, useQuery } from '@tanstack/react-query'
import React from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { deleteSubmission, getSubmission } from '../../api/submissions'
import Comments from './Comments'

const SubmissionView = () => {
  const params = useParams();
  const navigate = useNavigate();
  const mutation = useMutation({
    mutationFn: deleteSubmission,
    onSuccess: () => {
      navigate('/');
    }
  })
  const { isLoading, data } = useQuery({
    queryKey: ['stub2'],
    queryFn: () => getSubmission(params.id)
  });

  if (isLoading) return <div>Loading</div>

  console.log(data);

  const { title, community, url, id, comments } = data;
  return (
    <div>
      <h1>{title} (via <a href={`/communities/${community.id}`}>{community.name}</a>)</h1>
      <p><a href={url}>{url}</a></p>

      <div>
        <a
          className="btn btn-primary btn-sm"
          href={`/comments/new?${encodeURI(`comment[submission_id]=${id}`)}`}
        >
          Comment
        </a>

        <button className="btn btn-danger btn-sm" onClick={() => mutation.mutate(params.id)}>Delete Submission</button>
      </div>

      <Comments comments={comments} />

    </div>
  )
}

export default SubmissionView
