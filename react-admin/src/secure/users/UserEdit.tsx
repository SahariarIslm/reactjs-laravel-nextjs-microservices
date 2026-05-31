import React, { Component, SyntheticEvent } from 'react'
import Wrapper from '../Wrapper'
import axios from 'axios'
import { Role } from '../../classes/role'
import { Navigate } from 'react-router-dom';
import {User} from '../../classes/user';

interface UserEditProps {
    match: {
        params: {
            id: number;
        };
    };
}

export default class UserEdit extends Component<UserEditProps> {
    state = {
        roles:      [],
        first_name: '',
        last_name:  '',
        email:      '',
        role_id:    0,
        redirect:   false
    }
    id = 0;
    first_name = '';
    last_name = '';
    email = '';
    role_id = 0;

    componentDidMount = async () => {
        this.id = this.props.match.params.id;
        const response = await axios.get('roles')
        const userCall = await axios.get(`users/${this.id}`)
        const user: User = userCall.data.data
        this.setState({
            first_name: user.first_name,
            last_name: user.last_name,
            email: user.email,
            role_id: user.role.id,
            roles: response.data.data
        })
    }

    submit = async (e: SyntheticEvent) => {
        e.preventDefault();
        await axios.put(`users/${this.id}`,{
            first_name  : this.first_name,
            last_name   : this.last_name,
            email       : this.email,
            role_id     : this.role_id,
        })

        this.setState({
            redirect: true
        })
    }
    
    render() {
        if(this.state.redirect){
            return <Navigate to={"/users"} />
        }
        return (
            <Wrapper>
                <form className="form-signin" onSubmit={this.submit}>
                
                    <label htmlFor="firstName" className="sr-only">First Name</label>
                    <input type="text" id="firstName" className="form-control" placeholder="First Name" required autoFocus 
                        defaultValue={this.first_name = this.state.first_name}
                        onChange={e => this.first_name = e.target.value }
                    />

                    <label htmlFor="lastName" className="sr-only">Last Name</label>
                    <input type="text" id="lastName" className="form-control" placeholder="Last Name" required 
                        defaultValue={this.last_name = this.state.last_name}
                        onChange={e => this.last_name = e.target.value }
                    />

                    <label htmlFor="inputEmail" className="sr-only">Email address</label>
                    <input type="email" id="inputEmail" className="form-control" placeholder="Email address" required 
                        defaultValue={this.email = this.state.email}
                        onChange={e => this.email = e.target.value }
                    />

                    <label htmlFor="inputRole" className="sr-only">Role</label>
                    <select className="form-control"
                        value={this.role_id = this.state.role_id}
                        onChange={
                            e => {
                                this.role_id = parseInt(e.target.value)
                                this.setState({
                                    role_id: this.role_id
                                })
                            }}
                    >
                        <option>Select Role</option>
                        {this.state.roles.map(
                            (role:Role) => {
                                return (
                                    <option key={role.id} value={role.id}>{role.name}</option>
                                )
                            }
                        )}
                        
                    </select>

                    <button className="btn btn-lg btn-primary btn-block" type="submit">Update</button>
                </form>
            </Wrapper>
        )
    }
}