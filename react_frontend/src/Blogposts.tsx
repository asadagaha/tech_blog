import React from 'react';
import {useQuery} from '@apollo/react-hooks';
import gql from 'graphql-tag';



const GET_POSTS = gql`
    {
        blogposts {
        id
        title
        content
        }
    }
`;

const BlogPosts = () => {
    const {loading, error, data} = useQuery(GET_POSTS);
    const style = {
        padding: "0.5em",
        color: "#010101",
        background: "#eaf3ff",
        borderBottom: "solid 3px #516ab6"
    };

    if (loading) return (<div>ロード中...</div>);
    if (error) return (<div>Error ${error.message}</div>);
    return (
        <React.Fragment>
            {data.blogposts.map((post:any) => (
                <div key={post.id}>
                    <h1 style={style}>{post.title}</h1>
                    <h2>{post.content}</h2>
                </div>
            ))}
        </React.Fragment>
    )
};

export default BlogPosts;