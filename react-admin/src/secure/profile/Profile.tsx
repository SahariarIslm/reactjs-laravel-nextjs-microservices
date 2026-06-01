import React, { Component, SyntheticEvent } from 'react'
import Wrapper from '../Wrapper'
import axios from 'axios';

export default class Profile extends Component {
    state = {
        first_name: '',
        last_name: '',
        email: ''
    }
    first_name: string = '';
    last_name: string = '';
    email: string = '';
    password: string = '';
    password_confirm: string = '';

    componentDidMount = async () => {
        const response = await axios.get('user');
        const user = response.data.data;
        console.log(user)


        this.setState({
            first_name: user.first_name,
            last_name: user.last_name,
            email: user.email
        });
    }

    updateInfo = async (e: SyntheticEvent) => {
        e.preventDefault();
        await axios.put('user/info', {
            first_name: this.state.first_name,
            last_name: this.state.last_name,
            email: this.state.email
        })
    }

    updatePassword = async (e: SyntheticEvent) => {
        e.preventDefault();
        
        await axios.put('user/password', {
            password: this.password,
            password_confirm: this.password_confirm
        })

    }
    render() {
        return (
            <Wrapper>
                <h2>Account Information</h2>
                <hr/>
                <form onSubmit={this.updateInfo}>
                    <div className='form-group' onSubmit={this.updateInfo}>
                        <label>First Name</label>
                        <input type="text" className="form-control" name="first_name" 
                            defaultValue={ this.first_name = this.state.first_name}
                            onChange={e => this.setState({ first_name: e.target.value })}
                        />
                    </div>
                    <div className='form-group'>
                        <label>Last Name</label>
                        <input type="text" className="form-control" name="last_name" 
                            defaultValue={ this.last_name = this.state.last_name}
                            onChange={e => this.setState({ last_name: e.target.value })}
                        />
                    </div>
                    <div className='form-group'>
                        <label>Email</label>
                        <input type="email" className="form-control" name="email" 
                            defaultValue={ this.email = this.state.email}
                            onChange={e => this.setState({ email: e.target.value })}
                        />
                    </div>
                    <button className='btn btn-outline-primary mt-3'>Save Changes</button>
                </form>

                <h2 className='mt-5'>Change Password</h2>
                <hr/>
                <form onSubmit={this.updatePassword}>
                    <div className='form-group'>
                        <label> Password</label>
                        <input type="password" className="form-control" name="password"
                            onChange={e => this.password = e.target.value}
                        />
                    </div>
                    <div className='form-group'>
                        <label>Confirm Password</label>
                        <input type="password" className="form-control" name="password_confirm" 
                            onChange={e => this.password_confirm = e.target.value}
                        />
                    </div>
                    <button className='btn btn-outline-primary mt-3'>Change Password</button>
                </form>
            </Wrapper>
        )
    }
}
