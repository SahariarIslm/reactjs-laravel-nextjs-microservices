import React, { Component } from 'react'
import Wrapper from '../Wrapper';
import c3 from 'c3';
import axios from 'axios';

interface DashboardState {
    hasData: boolean;
    loading: boolean;
}

class Dashboard extends Component<{}, DashboardState> {
    state = {
        hasData: false,
        loading: true
    }

    componentDidMount = async () => {
        try {
            const response = await axios.get('chart');
            
            // 1. Direct array mapping based on your console log format
            const rawRecords = Array.isArray(response.data) ? response.data : (response.data.data || []);

            // 2. SORT records chronologically by date so the chart line makes sense
            const records = rawRecords.sort((a: any, b: any) => new Date(a.date).getTime() - new Date(b.date).getTime());

            // 3. Filter using 'sum' instead of 'sales'
            const validRecords = records.filter((r: any) => r && r.date !== undefined && r.sum !== undefined);

            if (validRecords.length === 0) {
                this.setState({ hasData: false, loading: false });
                return;
            }

            this.setState({ hasData: true, loading: false }, () => {
                c3.generate({
                    bindto: '#chart',
                    data: {
                        x: 'x',
                        columns: [
                            ['x', ...validRecords.map((r: any) => String(r.date))],
                            // ✨ FIXED HERE: Changed r.sales to r.sum to match your API response keys
                            ['Sales', ...validRecords.map((r: any) => Number(r.sum))]
                        ],
                        types: {
                            Sales: 'bar'
                        }
                    },
                    axis: {
                        x: {
                            type: 'timeseries',
                            tick: {
                                format: '%Y-%m-%d'
                            }
                        }
                    }
                });
            });

        } catch (error) {
            console.error("Critical error fetching chart data:", error);
            this.setState({ hasData: false, loading: false });
        }
    }

    render() {
        return (
            <Wrapper>
                <h2>Daily Sales</h2>
                
                {this.state.loading && (
                    <div className="alert alert-info">Processing transaction analytics...</div>
                )}

                {!this.state.loading && !this.state.hasData && (
                    <div className="alert alert-warning">
                        No valid sales data found to display.
                    </div>
                )}

                <div id="chart" style={{ display: this.state.hasData ? 'block' : 'none' }} />
            </Wrapper>
        )
    }
}

export default Dashboard;