import React, { useEffect, useState } from 'react';
import Wrapper from './Wrapper';
import axios from 'axios';
import { Product } from '../classes/product';
import Header from '../components/Header';
const Main = () => {
    const [products, setProducts] = useState([]);
    const [searchText, setSearchText] = useState('')
    useEffect( () => {
        (async () => {
            const response = await axios.get(`products?s=${searchText}`);
            setProducts(response.data.data)
        })();
    },[searchText])
    return (
        <Wrapper>
            <Header />
            <div className="album py-5 bg-light">
                <div className="container">
                    <div className="row">
                        <div className="col-md-12 mb-4 input-group">
                            <input type='text' className='form-control' placeholder='Search' 
                                onKeyUp={e=>setSearchText((e.target as HTMLInputElement).value)}
                            />
                        </div>
                        {products.map((product:Product)=>{
                            return (
                                <div className="col-md-4" key={product.id}>
                                    <div className="card mb-4 box-shadow">
                                        <img className="card-img-top" src={product.image} height={200} alt="Card cap" />
                                        <div className="card-body">
                                            <p className="card-text">{product.title}</p>
                                            <div className="d-flex justify-content-between align-items-center">
                                                <small className="text-muted">${product.price}</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            )
                        })}
                    </div>
                </div>
            </div>
        </Wrapper>
    );
};

export default Main;