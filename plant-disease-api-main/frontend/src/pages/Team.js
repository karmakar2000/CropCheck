/* eslint-disable jsx-a11y/anchor-is-valid */
import React from 'react';
import { Grid, Card, CardContent, Typography, Link, Avatar } from '@material-ui/core';
import LinkedInIcon from '@material-ui/icons/LinkedIn';
import GitHubIcon from '@material-ui/icons/GitHub';
import AppBar from "@material-ui/core/AppBar";
import { makeStyles } from "@material-ui/core/styles";

import Toolbar from "@material-ui/core/Toolbar";
import {
  Tab,
  Tabs
} from "@material-ui/core";
import cblogo from "../logo_icon.png";

const useStyles = makeStyles((theme) => ({
  grow: {
    flexGrow: 1,
  },
  appbar: {
    background: "#020642",
    boxShadow: "none",
    color: "white",
  },

}));
const teamMembers = [
  {
    name: "DEEP KARMAKAR",
    title: "Head of the team; Data Analyst",
    description: "A Data Science Enthusiast pursuing B. Tech. in Computer Science & Engineering who has fledged the complete code of our project.",
    img: "https://media.licdn.com/dms/image/D4D03AQFTZZZjGmdlRw/profile-displayphoto-shrink_800_800/0/1702388138312?e=1721865600&v=beta&t=Q_C5udE8fMf_md4jngUKK013FXl3u0r_AnQ9uGcFkDs",
    linkedin: "https://www.linkedin.com/in/deepkarmakar",
    github: "https://www.github.com/karmakar2000"
  },
  {
    name: "RAJA MONDAL",
    title: "Web Development Specialist; Flutter Developer",
    description: "Graduating with a degree in Computer Science, Raja has always loved coding and now he’s lucky enough to do it as part of his new job in our project.",
    img: "https://media.licdn.com/dms/image/C4D03AQFHBj-Ekt2XbQ/profile-displayphoto-shrink_800_800/0/1658081500581?e=1721865600&v=beta&t=lfi6qIdtfLc4jR9Up5atq7ea4H9m7zT7uL9CbLru0G8",
    linkedin: "https://www.linkedin.com/in/raja-mondal-859036196/",
    github: "https://github.com/imraja594"
  },
  {
    name: "ANSHU KUMAR SINGH",
    title: "Software Developer",
    description: "Anshu first fell in love with Python Programming at his institution. He loves to learn, and looks forward to being part of this new exciting industry for many years.",
    img: "https://media.licdn.com/dms/image/D5635AQHsgB-H4VAgcg/profile-framedphoto-shrink_800_800/0/1692843844987?e=1716746400&v=beta&t=-JQzWYrscQGjsg2X_wPiwaLAC7nqBletQzzVlAWsSXU",
    linkedin: "https://www.linkedin.com/in/anshu-singh-64791323a/",
    github: "https://github.com/ansh232001"
  },
  {
    name: "SOUMYADEEP MAJI",
    title: "Data Science Enthusiast; Competitive Programmer",
    description: "Graduating with a B. Tech. degree in Computer Science & Engineering and a B.S. in Data Science & Programming, Soumyadeep has always loved writing and now he’s lucky enough to do it as part of his new job in our project.",
    img: "https://media.licdn.com/dms/image/D5635AQEl-sknWj7k_w/profile-framedphoto-shrink_800_800/0/1708537489065?e=1716746400&v=beta&t=IDkzePRDpCpJ74ZXJpVIZnMPA-znhvxmgV7g9glc1-I",
    linkedin: "https://www.linkedin.com/in/soumyadeep-maji-a0673a248/",
    github: "https://media.licdn.com/dms/image/D5635AQEl-sknWj7k_w/profile-framedphoto-shrink_800_800/0/1708537489065?e=1716746400&v=beta&t=IDkzePRDpCpJ74ZXJpVIZnMPA-znhvxmgV7g9glc1-I"
  }
];

const Team = () => {
  const classes = useStyles();
  const message = "Our dedicated team of experts brings together a wealth of experience and passion for technology and innovation. Each member plays a crucial role in driving our project forward, ensuring its success and impact.";

  return (
    <>
      <AppBar position="static" className={classes.appbar}>
        <Toolbar>
          <a href='/' style={{ textDecoration: "none", color: "white" }}>
            <h3 className={classes.title} noWrap style={{ letterSpacing: '2.0px' }}>
              CropCheck
            </h3>
          </a>
          <div className={classes.grow} />
          <Tabs className={classes.nav} value={false} aria-label="navigation menu" >
            <Tab label="Home" component={Link} href="/" />
            <Tab label="About" component={Link} href="/about" />
            <Tab label="Team" component={Link} href="/team" />
          </Tabs>
          <Avatar src={cblogo}></Avatar>
        </Toolbar>
      </AppBar>

      <section className="section-white">
        <div className="container">
          <div className="row">
            <div className="col-md-12 text-center" style={{ padding: "30px 20px" }}>
              <h2 className="section-title">The Team Behind Plant Disease Identification</h2>
              <p className="section-subtitle">{message}</p>
            </div>
            <Grid container spacing={3}>
              {teamMembers.map((member, index) => (
                <Grid item xs={12} sm={6} md={6} key={index}>
                  <Card>
                    <CardContent>
                      <Avatar src={member.img} alt="pic" style={{ width: '200px', height: '200px', borderRadius: '50%', margin: '0 auto' }} />
                      <Typography variant="h5" component="h2">
                        {member.name}
                      </Typography>
                      <Typography color="textSecondary">
                        {member.title}
                      </Typography>
                      <Typography variant="body2" component="p">
                        {member.description}
                      </Typography>
                      <ul className="team-icon" style={{ listStyleType: 'none', padding: 0, display: 'flex', justifyContent: 'center', marginTop: '10px' }}>
                        <li style={{ margin: '0 10px' }}>
                          <Link href={member.linkedin} target="_blank" rel="noopener noreferrer">
                            <LinkedInIcon />
                          </Link>
                        </li>
                        <li style={{ margin: '0 10px' }}>
                          <Link href={member.github} target="_blank" rel="noopener noreferrer">
                            <GitHubIcon />
                          </Link>
                        </li>
                      </ul>
                    </CardContent>
                  </Card>
                </Grid>
              ))}
            </Grid>
          </div>
        </div>
      </section>
    </>
  );
};

export default Team;
