import axios from 'axios';

export const getCommunities = async () => (await axios.get('/api/communities')).data;

export const postCommunity = async (data) => await axios.post('/api/communities', data)

export const getCommunity = async (id) => (await axios.get(`/api/communities/${id}`)).data
