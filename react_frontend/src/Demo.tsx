import React from 'react';
import {useQuery} from '@apollo/react-hooks';
import gql from 'graphql-tag';

const GET_USERS = gql`
    {
        users{
            id
            name
            email
        }
    }
`;


const Demo = () => {
    const {loading, error, data} = useQuery(GET_USERS);
    const style = {
        color: "red"
    };

    if (loading) return (<div>ロード中...</div>);
    if (error) return (<div>Error ${error.message}</div>);
    return (
        <React.Fragment>
            {data.users.map((user:any) => (
                <div key={user.id}>
                    <h1>{user.name}</h1>
                    <h2>{user.email}</h2>
                    <h1 style={style}>ここまでが{user.id}回目！</h1>
                </div>
            ))}
        </React.Fragment>
    )
};

export default Demo;