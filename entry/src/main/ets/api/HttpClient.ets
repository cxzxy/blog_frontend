import axios from '@ohos/axios'

const  apiClient = axios.create({
  baseURL: 'http://172.16.24.79:8080',
  timeout: 1000,
  headers: {
    'Content-Type': 'application/json',
    // 'Content-Type': 'application/x-www-from-urlencoded',
  }
})

export default  apiClient