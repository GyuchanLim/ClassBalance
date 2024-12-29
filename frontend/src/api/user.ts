import api from './index'

const endpoints: Endpoints = {
    getUsers: async () => {
        return await api('users')
    }
}

export default endpoints
