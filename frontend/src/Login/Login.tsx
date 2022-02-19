import { Button, Layout, Space, Typography } from "antd";
import { GithubOutlined, TwitterOutlined, WindowsOutlined } from "@ant-design/icons";
import { Content } from "antd/lib/layout/layout";
import "./login.css";
import Title from "antd/lib/skeleton/Title";

const LoginButton: React.FC<{ authProvider: string }> = ({ authProvider, children }) => (
    <Button
        type="primary"
        href={`/.auth/login/${authProvider}`}
        className="login-button"
        size="large"
    >
        {children}
    </Button>
)

const Login = () => {

    return (
        <Layout className="login-layout">
            <Content
                className="site-layout-background"
            >
                <Typography.Title className="login-heading" title="1">
                    Sign in to Todo App <br />
                    <small>Welcome Back!</small>
                </Typography.Title >
                <Space wrap={true} size="large" className="login-button-container">
                    <LoginButton authProvider="aad">
                        <WindowsOutlined /> Login with Microsoft
                    </LoginButton>

                    <LoginButton authProvider="github">
                        <GithubOutlined /> Login with Github
                    </LoginButton>

                    <LoginButton authProvider="twitter">
                        <TwitterOutlined /> Login with Twitter
                    </LoginButton>
                </Space>
            </Content>
        </Layout>
    )
}

export default Login;