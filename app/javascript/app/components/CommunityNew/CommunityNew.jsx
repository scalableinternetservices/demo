import { useMutation } from '@tanstack/react-query';
import React from 'react'
import { useForm } from 'react-hook-form'
import { useNavigate } from 'react-router-dom';
import { postCommunity } from '../../api/communities';

const CommunityNew = () => {
  const { register, handleSubmit, formState: { errors } } = useForm()
  const navigate = useNavigate();
  const mutation = useMutation({
    mutationFn: postCommunity,
    onSuccess: () => {
      navigate('/');
    }
  })

  const submit = async (data) => {
    await mutation.mutate(data);
  }

  return (
    <form onSubmit={handleSubmit(submit)}>
      <h1>New Community</h1>
      <label htmlFor="name">Name</label>
      <input id="name" className="form-control" {...register('name', { required: 'name is required', minLength: { value: 4, message: 'too short (min is 4 characters)'}})} />
      <p>{errors.name?.message}</p>

      <button className="btn btn-primary">Create Community</button>
    </form>
  )
}

export default CommunityNew
