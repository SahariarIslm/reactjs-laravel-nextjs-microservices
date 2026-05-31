import React, { Component } from 'react'
import Wrapper from '../Wrapper'
import axios from 'axios'
import { Link } from 'react-router-dom';
import { Product } from '../../classes/product'

export default class Products extends Component {
    state = {
        products: []
    }
    componentDidMount = async() => {
        const response = await axios.get('products')
        this.setState({
            products: response.data.data
        })
    }
    delete = async(id: number) => {
        if(window.confirm('Are you sure you want to delete this record?')){
            await axios.delete(`products/${id}`);
            this.setState({
                products: this.state.products.filter((r:Product) => r.id !== id)
            })
        }
    }
    render() {
            return (
                <Wrapper>
                    <div className="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 ob-2 mb-3 border-bottom">
                        <div className='btn-toolbar mb-2 mb-md-0'>
                            <Link to={'/products/create'} className='btn btn-sm btn-outline-secondary'>Add</Link>
                        </div>
                    </div>
                    <div className="table-responsive small"> 
                        <table className="table table-striped table-sm"> 
                            <thead> 
                                <tr> 
                                    <th scope="col">#</th> 
                                    <th scope="col">Image</th> 
                                    <th scope="col">Title</th> 
                                    <th scope="col">Description</th> 
                                    <th scope="col">Price</th> 
                                    <th scope="col">Action</th> 
                                </tr>
                            </thead> 
                            <tbody> 
                                {this.state.products.map(
                                    (product:Product) => {
                                        return (
                                            <tr key={product.id}>
                                                <td>{product.id}</td>
                                                <td><img src={product.image} width="50" /></td>
                                                <td>{product.title}</td>
                                                <td>{product.description}</td>
                                                <td>{product.price}</td>
                                                <td>
                                                    <Link to={`/products/${product.id}/edit`} className='btn btn-sm btn-outline-secondary'>
                                                        Edit
                                                    </Link>
                                                    <a href='#' className='btn btn-sm btn-outline-secondary' 
                                                        onClick={() => this.delete(product.id)}
                                                    >
                                                        Delete
                                                    </a>
                                                </td>
                                            </tr>
                                        )
                                    }
                                )}
                            </tbody> 
                        </table> 
                    </div>
                </Wrapper>
            )
    }
}
