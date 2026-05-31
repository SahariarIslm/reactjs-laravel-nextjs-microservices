import React, { Component, SyntheticEvent } from 'react'
import Wrapper from '../Wrapper'
import axios from 'axios'
import { Role } from '../../classes/role'
import { Navigate } from 'react-router-dom';

export default class UserCreate extends Component {
    state = {
        roles:[],
        redirect: false
    }
    first_name = '';
    last_name = '';
    email = '';
    role_id = 0;
    componentDidMount = async() => {
        const response = await axios.get('roles')

        this.setState({
            roles: response.data.data
        })
    }

    submit = async (e: SyntheticEvent) => {
        e.preventDefault();
        await axios.post('users',{
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
                        onChange={e => this.first_name = e.target.value }
                    />

                    <label htmlFor="lastName" className="sr-only">Last Name</label>
                    <input type="text" id="lastName" className="form-control" placeholder="Last Name" required 
                        onChange={e => this.last_name = e.target.value }
                    />

                    <label htmlFor="inputEmail" className="sr-only">Email address</label>
                    <input type="email" id="inputEmail" className="form-control" placeholder="Email address" required 
                        onChange={e => this.email = e.target.value }
                    />

                    <label htmlFor="inputRole" className="sr-only">Role</label>
                    <select className="form-control"
                        onChange={e => this.role_id = parseInt(e.target.value) }
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

                    <button className="btn btn-lg btn-primary btn-block" type="submit">Reginster</button>
                </form>
            </Wrapper>
        )
    }
}
