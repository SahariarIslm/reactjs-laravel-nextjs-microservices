import React, { PropsWithRef, useEffect, useState } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

const Header = (props: PropsWithRef<any>) => {
    const [title,setTitle] = useState('Welcome')
    const [description,setDescription] = useState('Share Links and earn 10% of the product price')
    useEffect(()=>{
        console.log(props.user);
        if(props.user?.id){
            setTitle('$'+props.user?.revenue)
            setDescription('You have earned in total')
        }
    },[props])
    
    let buttons;
    if(props.user){
        buttons = (
            <p>
                <Link to={'/stats'} className="btn btn-primary my-2">Stats</Link>
            </p>
        );
    }else{
        buttons = (
            <p>
                <Link to={'/login'} className="btn btn-primary my-2">Login</Link>
                <Link to={'/register'} className="btn btn-secondary my-2">Register</Link>
            </p>
        );
    }
    return (
        <section className="jumbotron text-center">
            <div className="container">
                <h1 className="jumbotron-heading">{title}</h1>
                <p className="lead text-muted">{description}</p>
                {buttons}
            </div>
        </section>
    );
};

export default connect((state: any) => ({user: state.user}))(Header);