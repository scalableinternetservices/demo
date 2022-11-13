import React from 'react'
import Comment from './Comment'

const Comments = ({ comments }) => {
  console.log(comments);
  return (
    <div>
      Comments:<br/>
      <div className="card bg-light">
        {
          comments.map((comment) => {
            return <Comment {...comment} />
          })
        }

      </div>

    </div>
  )
}

export default Comments
