import React from 'react';

import Dashboard from './secure/dashboard/Dashboard';
import Users from './secure/users/Users';
import Login from './public/Login';
import Register from './public/Register';
import UserCreate from './secure/users/UserCreate';
import UserEdit from './secure/users/UserEdit';
import Roles from './secure/roles/Roles';
import RoleCreate from './secure/roles/RoleCreate';
import RoleEdit from './secure/roles/RoleEdit';
import ProductEdit from './secure/products/ProductEdit';
import Products from './secure/products/Products';
import { BrowserRouter, Routes, Route, useParams } from 'react-router-dom';
import ProductCreate from './secure/products/ProductCreate';
import Orders from './secure/orders/Orders';

const UserEditWrapper = () => {
  const { id } = useParams<{ id: string }>();
  return (
    <UserEdit 
      match={{
        params: {
          id: Number(id) 
        }
      }} 
    />
  );
};

const RoleEditWrapper = () => {
  const { id } = useParams<{ id: string }>();
  return (
    <RoleEdit 
      match={{
        params: {
          id: Number(id) 
        }
      }} 
    />
  );
};

const ProductEditWrapper = () => {
  const { id } = useParams<{ id: string }>();
  return (
    <ProductEdit 
      match={{
        params: {
          id: Number(id) 
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
          <Route path={'/roles/:id/edit'} element={<RoleEditWrapper />} />
          <Route path={'/products'} Component={Products} />
          <Route path={'/products/create'} Component={ProductCreate} />
          <Route path={'/products/:id/edit'} element={<ProductEditWrapper />} />
          <Route path={'/orders'} Component={Orders} />
        </Routes>
      </BrowserRouter>   
    </div>
  );
}

export default App;