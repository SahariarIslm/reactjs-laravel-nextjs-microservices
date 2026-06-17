// Get API URL from environment variables or use defaults
const getApiUrl = () => {
    // If running in Docker, use container name (laravel-admin)
    // If running locally, use localhost:8000
    // Can be overridden via REACT_APP_API_URL environment variable
    const apiUrl = process.env.REACT_APP_API_URL || 'http://localhost:8000/api/influencer';
    return apiUrl;
};

const getCheckoutUrl = () => {
    const checkoutUrl = process.env.REACT_APP_CHECKOUT_URL || 'http://localhost:3002';
    return checkoutUrl;
};

const dev = {
    BASE_URL: getApiUrl(),
    CHECKOUT_URL: getCheckoutUrl()
}

const prod = {
    BASE_URL: getApiUrl(),
    CHECKOUT_URL: getCheckoutUrl()
}

export default {
    ...(process.env.NODE_ENV === 'development' ? dev : prod) 
}

