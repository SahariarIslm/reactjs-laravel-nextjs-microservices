import React, { PropsWithRef } from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';

const Nav = (props: PropsWithRef<any>) => {
    let menu;
    if (props.user) {
        menu = (
            <>
                <nav className='my-2 my-md-0 mr-mb-3'>
                    <Link to={'/rankings'} className='p-2 text-dark'>Rankings</Link>
                    <Link to={'/login'} onClick={() => localStorage.clear()} className='p-2 text-dark'>Logout</Link>
                    <Link to={'/profile'} className='btn btn-outline-primary'>{props.user.first_name}</Link>
                </nav>
            </>
        );
    }else{
        menu = (
            <Link to={'/login'} className='btn btn-outline-primary'>Login</Link>
        );
    }
    return (
        <div style={{justifyContent: 'space-between'}} className='d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 border-bottom shadow-sm'>
            <Link to={'/'} style={{fontWeight:'bold', textDecoration:'none'}} className="my-8 mr-md-auto font-weight-normal">Influencer</Link>
            
            {menu}
        </div>
    );
};

export default connect((state: any) => ({user: state.user}))(Nav);