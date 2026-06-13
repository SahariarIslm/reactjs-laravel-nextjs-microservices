import React from 'react';
import { Link } from 'react-router-dom';

const Nav = () => {
    return (
        <div style={{justifyContent: 'space-between'}} className='d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 border-bottom shadow-sm'>
            <Link to={'/'} style={{fontWeight:'bold', textDecoration:'none'}} className="my-8 mr-md-auto font-weight-normal">Influencer</Link>
            <Link to={'/login'} className="btn btn-outline-primary">Login</Link>
        </div>
    );
};

export default Nav;