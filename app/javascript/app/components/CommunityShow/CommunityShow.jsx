import { useQuery } from '@tanstack/react-query'
import React from 'react'
import { useParams } from 'react-router-dom'
import { getCommunity } from '../../api/communities'
import SubmissionList from '../shared/SubmissionList'

const CommunityShow = () => {
  const params = useParams();
  const { data, isLoading } = useQuery({
    queryFn: () => getCommunity(params.id),
    queryKey: ['community']
  });

  if (isLoading) return <div>Loading</div>;

  return (
    <div>
      <h1>{data.name}</h1>
      <SubmissionList submissions={data.submissions} />
    </div>
  )
}

export default CommunityShow
