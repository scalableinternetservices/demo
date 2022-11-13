import { useQuery, useMutation } from '@tanstack/react-query';
import React, { useEffect } from 'react'
import { useForm } from 'react-hook-form'
import { useNavigate } from 'react-router-dom';
import { getCommunities } from '../../api/communities';
import { postSubmission } from '../../api/submissions';
import { FormRow } from '@appfolio/react-gears'

const SubmissionNew = () => {
  const navigate = useNavigate()
  const mutation = useMutation({
    mutationFn: postSubmission,
    onSuccess: () => {
      // Invalidate and refetch
      navigate('/');
      // queryClient.invalidateQueries({ queryKey: ['todos'] })
    },
  })

  const { data = [], isLoading, error } = useQuery({
    queryKey: ['communities'],
    queryFn: getCommunities
  });

  useEffect(() => {
    if (data.length) {
      reset({
        community: data[0].id
      });
    };
  }, [data]);

  const { register, handleSubmit, reset, formState: { errors } } = useForm();

  const submit = async (data) => {
    console.log(data);
    await mutation.mutate(data);
  }

  console.log(errors);
  return (
    <div>
      <h1>New Submission</h1>
      <form onSubmit={handleSubmit(submit)}>
        <div class="form-group">

          <FormRow stacked label="Title" feedback={errors.title?.message} />
          <label forHtml="title">Title</label>
          <input
            id="title"
            className="form-control"
            {...register(
              'title',
              {
                required: 'title is required',
                minLength: { value: 5, message: 'too short'} })
              }
          />
          <p>{errors.title?.message}</p>

          <label for="url">URL</label>
          <input
            id="url"
            className="form-control"
            {...register(
              'url',
              {
                required: 'url is required',
                pattern: {
                  value: /[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/,
                  message: 'not a url'
                }
              })}
          />
          <p>{errors.url?.message}</p>

          <label for="community">Community</label>
          <select id="community" className="form-control" {...register('community')}>
            {
              data.map((community) => (<option value={community.id}>{community.name}</option>))
            }
          </select>
        </div>
        <button className="btn-primary btn-sm">Create Comment</button>
      </form>
    </div>

  )
}

export default SubmissionNew
