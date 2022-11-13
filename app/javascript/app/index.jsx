import React from 'react';
import { createRoot } from 'react-dom/client'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import {
  createRoutesFromElements,
  createBrowserRouter,
  RouterProvider,
  Route,
  Outlet,
  defer
} from "react-router-dom";
import SubmissionView from './components/SubmissionView/SubmissionView';
import CommentsNew from './components/CommentsNew/CommentsNew';
import SubmissionNew from './components/SubmissionNew/SubmissionNew';
import FrontPage from './components/FrontPage/FrontPage';
import CommunityNew from './components/CommunityNew/CommunityNew';
import CommunityShow from './components/CommunityShow/CommunityShow';
import { getSubmissions } from './api/submissions';

const Sample = (props) => {
  console.log(props);
  return (
    <div>
      <div>Surrounding</div>
      <Outlet />
    </div>
  );
}

const timeout = (ms, data) => new Promise((resolve) => setTimeout(() => resolve(data), ms));

const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" element={<Sample />}>
      <Route index element={<FrontPage />} loader={async () => {
        const data = timeout(3000, { sample: 'data' })
        const submissions = getSubmissions();
        return {
          data,
          submissions
        };
      }} />
      <Route path="submissions/new" element={<SubmissionNew />} />
      <Route path="/submissions/:id" element={<SubmissionView />} />
      <Route path="/comments/new" element={<CommentsNew />} />
      <Route path="/communities/new" element={<CommunityNew />} />
      <Route path="/communities/:id" element={<CommunityShow />} />
    </Route>
  )
);

const queryClient = new QueryClient()

const root = createRoot(document.getElementById('app_root'));
root.render(
  <QueryClientProvider client={queryClient}>
    <RouterProvider router={router} />
  </QueryClientProvider>
);

