const dev = {
    BASE_URL: 'http://localhost:8000/api/influencer',
    CHECKOUT_URL: 'http://localhost:3002'
}

const prod = {
    BASE_URL: 'http://localhost:8000/api/influencer',
    CHECKOUT_URL: 'http://localhost:3002'
}

export default {
    ...(process.env.NODE_ENV === 'development' ? dev : prod) 
}

