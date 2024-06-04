import React from "react";
import { createBrowserRouter } from "react-router-dom";
import { ImageUpload } from "../home";
import About from "../pages/About";
import Team from "../pages/Team";

const router = createBrowserRouter([
    {
        exact: true,
        path: "/",
        element: <ImageUpload />,
    },
    {
        exact: true,
        path: "/about",
        element: <About />,
    }, {
        exact: true,
        path: "/team",
        element: <Team />,
    },
]);

export default router;
