import axios from 'axios'

const timeout = (ms, data) => new Promise((resolve) => setTimeout(() => resolve(data), ms));
export const getSubmissions = async () => {
  await timeout(3000, {});
  return (await axios.get('/api/submissions')).data
}

export const getSubmission = async (id) => {x
  const data = (await axios.get(`/api/submissions/${id}`)).data
  return {
    ...data,
    comments: data.comments.reduce((nestedComments, comment) => {
      nestedComments.ref[comment.id] = comment;
      comment.replies = [];

      if (comment.parent_id ) {
        nestedComments.ref[comment.parent_id].replies.push(comment)
      } else {
        nestedComments.arr.push(comment);
      }

      return nestedComments;
    }, { arr: [], ref: {}}).arr,
  };
}

export const postSubmission = async ({ title, url, community }) => {
  return axios.post('/api/submissions', {
    title,
    url,
    community_id: community
  });
}

export const deleteSubmission = async (id) => {
  return axios.delete(`/api/submissions/${id}`);
}
