import { useMutation } from '@tanstack/react-query';
import React from 'react'
import { useForm } from 'react-hook-form'
import { useNavigate, useParams } from 'react-router-dom';
import { postCommunity } from '../../api/communities';

const CommentsNew = () => {
  const params = useParams();
  const navigate = useNavigate();
  const mutation = useMutation({
    mutationFn: postCommunity,
    onSuccess: () => {
      navigate('/');
    }
  })
  const { register, handleSubmit } = useForm();

  const submit = async (data) => {
    console.log(params);
    console.log(data);
    await mutation.mutate(data);
  }

  return (
    <div>
      <h1>New Comment</h1>
      <form onSubmit={handleSubmit(submit)}>
        <div className="input  comment_message form-group">
          <label for="comment_message">Message</label>
          <textarea id="comment_message" className="form-control" {...register('message')} />
        </div>
        <button className="btn-primary btn-sm">Create Comment</button>
      </form>
    </div>

  )
}

export default CommentsNew
