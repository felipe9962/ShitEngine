//
// Created by Felipe on 10/03/2022.
//
#include <ogl3d/include/ogl3d/window/OWindow.h>
#include <Windows.h>
#include <GLFW/glfw3.h>
#include <assert.h>

OWindow::OWindow() {
// define the function's prototype
    typedef void (*GL_GENBUFFERS) (GLsizei, GLuint*);
// find the function and assign it to a function pointer
    GL_GENBUFFERS glGenBuffers  = (GL_GENBUFFERS)wglGetProcAddress("glGenBuffers");
// function can now be called as normal
    unsigned int buffer;
    glGenBuffers(1, &buffer);

}

OWindow::~OWindow() {

}
