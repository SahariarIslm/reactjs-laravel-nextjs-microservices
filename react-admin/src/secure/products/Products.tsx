import React, { Component } from 'react'
import Wrapper from '../Wrapper'
import axios from 'axios'
import { Link } from 'react-router-dom';
import { Product } from '../../classes/product'
import Paginator from '../components/Paginator'
import Deleter from '../components/Deleter';

export default class Products extends Component{
    state = {
        products: []
    }
    page = 1;
    last_page = 0;
    
    componentDidMount = async () => {
        const response = await axios.get(`products?page=${this.page}`);
        this.setState({
            products: response.data.data
        });
        this.last_page = response.data.meta.last_page
    }
    
    handleDelete = async(id: number) => {
        this.setState({
            products: this.state.products.filter((r:Product) => r.id !== id)
        })
    }

    handlePageChange = async (page: number) => {
        this.page = page;
        await this.componentDidMount();
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
                                                <td><img src={product.image} alt='' width="50" /></td>
                                                <td>{product.title}</td>
                                                <td>{product.description}</td>
                                                <td>{product.price}</td>
                                                <td>
                                                    <Link to={`/products/${product.id}/edit`} className='btn btn-sm btn-outline-secondary'>
                                                        Edit
                                                    </Link>
                                                    <Deleter id={product.id} endpoint='products' handleDelete={this.handleDelete} />
                                                </td>
                                            </tr>
                                        )
                                    }
                                )}
                            </tbody> 
                        </table> 
                    </div>
                    <Paginator lastPage={this.last_page} handlePageChange={this.handlePageChange}    />
                </Wrapper>
            )
    }
}
