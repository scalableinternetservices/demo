import React from 'react'
import { Link } from 'react-router-dom'

const SubmissionList = ({ submissions }) => {
  return (
    <table className="table">
      <thead>
        <tr>
          <th>Title</th>
          <th>Url</th>
          <th>Community</th>
          <th colSpan="3"></th>
        </tr>
      </thead>

      <tbody>
        {
          submissions.map(({ id, comments, title, url, community }) => (
            <tr key={id}>
              <td><a href={url}>{title}</a></td>
              <td>{url}</td>
              <td><Link to={`communities/${community.id}`}>{community.name}</Link></td>
              <td><Link className="btn btn-primary btn-sm" to={`submissions/${id}`}>{comments.length} comments</Link></td>
            </tr>
          ))
        }
      </tbody>
    </table>
  )
}

export default SubmissionList
