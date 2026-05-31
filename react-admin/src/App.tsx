import React from 'react';

import Dashboard from './secure/dashboard/Dashboard';
import Users from './secure/users/Users';
import Login from './public/Login';
import Register from './public/Register';
import UserCreate from './secure/users/UserCreate';
import UserEdit from './secure/users/UserEdit';
import Roles from './secure/roles/Roles';
import RoleCreate from './secure/roles/RoleCreate';
import { BrowserRouter, Routes, Route, useParams } from 'react-router-dom';


const UserEditWrapper = () => {
  const { id } = useParams<{ id: string }>();
  return (
    <UserEdit 
      match={{
        params: {
          id: Number(id) // Converted to a number to match your UserEditProps interface
        }
      }} 
    />
  );
};


function App() {
  return (
    <div className='App'> 
      <BrowserRouter>
        <Routes>
          <Route path={'/'} Component={Dashboard} />
          <Route path={'/login'} Component={Login} />
          <Route path={'/register'} Component={Register} />
          <Route path={'/users'} Component={Users} />
          <Route path={'/users/create'} Component={UserCreate} />
          <Route path={'/users/:id/edit'} element={<UserEditWrapper />} />
          <Route path={'/roles'} Component={Roles} />
          <Route path={'/roles/create'} Component={RoleCreate} />
        </Routes>
      </BrowserRouter>   
    </div>
  );
}

export default App;
