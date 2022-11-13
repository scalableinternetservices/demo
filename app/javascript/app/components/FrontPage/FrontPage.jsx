import { useQuery } from '@tanstack/react-query'
import React, { Suspense } from 'react'
import { Await, Link, useLoaderData, useNavigation, useRevalidator } from 'react-router-dom';
import { getSubmissions } from '../../api/submissions'
import SubmissionList from '../shared/SubmissionList';

const FrontPage = () => {
  const dataLoader = useLoaderData();
  const navigation = useNavigation();
  const revalidate = useRevalidator();
  console.log(navigation.state);
  // console.log(dataLoader);


  // const { isLoading, error, data = [], isFetching } = useQuery({
  //   queryKey: ['stub'],
  //   queryFn: getSubmissions
  // });

  // if (isLoading) return <div>Loading</div>
  // if (error) return <div>Something went wrong: {JSON.stringify(error)}</div>

  return (
    <>
      <h1>Front Page!</h1>
      <Suspense fallback={<p>Still Loading....</p>}>
        <Await resolve={dataLoader.data}>
          {data => (
            <p>{JSON.stringify(data)}</p>
          )}
        </Await>
      </Suspense>

      <Suspense fallback={<p>Still Loading Submissions....</p>}>
        <Await resolve={dataLoader.submissions}>
            {data => {
              console.log('submission');
              console.log(data);
              return (<SubmissionList submissions={data} />);
            }}
        </Await>
      </Suspense>


      <button onClick={() => revalidate.revalidate()}>Revalidate</button>
      <Link className="btn btn-primary" to="/submissions/new">New Submission</Link>
      <Link className="btn btn-primary ml-1" to="/communities/new">New Community</Link>

    </>
  )
}

export default FrontPage
