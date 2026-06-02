import React, { Component, SyntheticEvent } from 'react'
import axios from 'axios';
import { Navigate } from 'react-router-dom';

class Login extends Component{
    componentDidMount() {
        // Inject the style tag dynamically when Login loads
        const link = document.createElement('link');
        link.rel = 'stylesheet';
        link.href = '/public.css'; 
        link.id = 'public-bootstrap-css';
        document.head.appendChild(link);
    }

    componentWillUnmount() {
        // Remove it when the user leaves the page to prevent styling leaks
        const link = document.getElementById('public-bootstrap-css');
        if (link) {
        link.remove();
        }
    }

    email = '';
    password = '';
    state = {
        redirect: false
    }

    submit = async (e: SyntheticEvent) => {
        e.preventDefault();

        const response = await axios.post('login', {
            email: this.email,
            password: this.password,
        });

        // Store token in axios default header
        axios.defaults.headers.common['Authorization'] = `Bearer ${response.data.access_token}`;

        this.setState({ redirect: true })
    }

    render(){
        if(this.state.redirect){
            return <Navigate to="/" />;
        };
        return (
            <form className="form-signin" onSubmit={this.submit}>
                <h1 className="h3 mb-3 font-weight-normal">Please sign in</h1>
                <label htmlFor="inputEmail" className="sr-only">Email address</label>
                <input type="email" id="inputEmail" className="form-control" placeholder="Email address" required 
                    onChange={e => this.email = e.target.value}
                />
                <label htmlFor="inputPassword" className="sr-only">Password</label>
                <input type="password" id="inputPassword" className="form-control" placeholder="Password" required 
                    onChange={e => this.password = e.target.value}
                />
                <button className="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        )
    }
}

export default Login