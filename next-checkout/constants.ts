// Get API URL from environment variables or use defaults
const getEndpoint = () => {
    const endpoint = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000/api/checkout';
    return endpoint;
};

export default {
    endpoint: getEndpoint(),
    stripe_key: process.env.NEXT_PUBLIC_STRIPE_KEY || 'pk_test_51TgfwzCxnrjNjmoRhIJFaovmoNhNmwMxAlS36KTIUjocg3qrPb4TNfeR2GMvdnhX3HmORpOfQO4VHm09Lbg10L3300P2zuto0f'
}