import React, { Component } from "react";
import Login from "../components/Login";
import SignUp from "../components/signUp";
import Alert from "../components/Alert";
import axios from "axios";
import Main from "./MainPage";
import { Redirect } from "react-router-dom";

import { User, host } from "../User";
import { images } from "../Jsons/ModelInputs";
import "../styles/login.css";
import { Background } from "../styles/Background.js";

class Registration extends Component {
  User = new User();
  state = {
    path: "",
    user: {},
    massage: "",
    showMassage: [],
    check: false,
    redirect: false,
    background: null,
    host: host
  };

  componentDidMount = () => {
    if (this.props.match.params.login === "true")
      return (
        <Login
          check={this.check}
          getName={this.getName}
          getPassword={this.getPassword}
          submit={this.loginUser}
        />
      );
    return (
      <SignUp
        getName={this.getName}
        getPassword={this.getPassword}
        getLastName={this.getLastName}
        getMail={this.getMail}
        submit={this.submitUser}
      />
    );
  };

  getName = async name => {
    this.User.first_name = name;
  };

  getPassword = async password => {
    this.User.password = password;
  };

  getLastName = async lastName => {
    this.User.last_name = lastName;
  };

  getMail = async mail => {
    this.User.mail = mail;
  };

  loginUser = async () => {
    await this.setState({ user: this.User });
    let massage =
      !this.state.user.first_name || !this.state.user.password
        ? "Not all fields entered. \n"
        : "";
    await this.setState({ massage });
    if (massage) {
      await this.setState({ showMassage: <Alert str={this.state.massage} /> });
      this.state.showMassage = [];
    } else {
      let login = await this.login();
      if (login) {
        this.setState({ redirect: true });
      }
    }
  };

  submitUser = async () => {
    await this.setState({ user: this.User });
    let massage = "";
    massage = !this.checkInputs() ? "Not all fields enreted. " : "";
    massage += !this.checkMailInput() ? "Mail unvalid." : "";
    await this.setState({ massage });
    if (massage) {
      await this.setState({ showMassage: <Alert str={this.state.massage} /> });
      this.state.showMassage = [];
    } else {
      let inserted = await this.insert();
      if (inserted) {
        localStorage.setItem("user", JSON.stringify(this.state.user));
        this.setState({ redirect: true });
      }
    }
  };

  checkInputs = () => {
    if (
      !this.state.user.first_name ||
      !this.state.user.last_name ||
      !this.state.user.password ||
      !this.state.user.mail
    )
      return false;
    return true;
  };

  checkMailInput = () => {
    let re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(this.state.user.mail).toLowerCase());
  };

  check = async () => {
    await this.setState({ check: this.state.check ? false : true });
  };

  openLogin = () => {
    return (
      <Login
        check={this.check}
        getName={this.getName}
        getPassword={this.getPassword}
        submit={this.loginUser}
      />
    );
  };

  openSignUp = () => {
    return (
      <SignUp
        getName={this.getName}
        getPassword={this.getPassword}
        getLastName={this.getLastName}
        getMail={this.getMail}
        submit={this.submitUser}
      />
    );
  };

  openMain = () => {
    return <Main />;
  };

  insert = async () => {
    if (this.state.user) {
      const response = await axios.get(`${this.state.host}/insertUser`, {
        params: {
          user: this.state.user
        }
      });
      if (response.data === "inserted") return true;
      else {
        await this.setState({ showMassage: <Alert str={response.data} /> });
        this.state.showMassage = [];
        return false;
      }
    }
  };

  login = async () => {
    const options = {
      params: {
        first_name: this.state.user.first_name,
        password: this.state.user.password,
        rememberMe: this.state.check
      },
      withCredentials: true
    };

    const response = await axios.get(`${this.state.host}/loginUser`, options);
    if (response.data === "found") return true;
    else if (response.data === "found-admin") {
      this.User.role = 1;
      this.setState({ user: this.User });
      return true;
    } else {
      await this.setState({ showMassage: <Alert str={response.data} /> });
      this.state.showMassage = [];
      return false;
    }
  };
  render() {
    if (this.state.redirect) {
      return <Redirect to="/" />;
    }
    var background = new Background(
      `url(${images.loginImage}) no-repeat center center fixed`
    );
    return (
      <div className="mybody p-0" style={background}>
        <div className="row">{this.componentDidMount()}</div>
        {this.state.showMassage}
      </div>
    );
  }
}

export default Registration;
