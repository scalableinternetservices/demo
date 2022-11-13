import React from 'react'

const Comment = ({ id, message, parent_id, submission_id, replies }) => {
  return (
    <div className="card-body b-1">
      {message}<br/>
      <a
        className="btn btn-primary btn-sm"
        href={`/comments/new?${encodeURI(`comment[parent_id]=${id}&comment[submission_id]=${submission_id}`)}`}
      >
        Reply
      </a>
      <a
        className="btn btn-danger btn-sm"
        // data-confirm="Are you sure?"
        rel="nofollow"
        data-method="delete"
        href={`/comments/${id}`}
      >
        Delete
      </a>
      {replies?.map((reply) => <Comment {...reply} />)}
    </div>
  )
}

export default Comment
