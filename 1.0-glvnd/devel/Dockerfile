ARG from

# Download the official headers from github.com/KhronosGroup
FROM ubuntu:16.04 as khronos

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        git && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/KhronosGroup/OpenGL-Registry.git && cd OpenGL-Registry \
    git checkout 681c365c012ac9d3bcadd67de10af4730eb460e0 && \
    cp -r api/GL /usr/local/include

RUN git clone https://github.com/KhronosGroup/EGL-Registry.git && cd EGL-Registry \
    git checkout 0fa0d37da846998aa838ed2b784a340c28dadff3 && \
    cp -r api/EGL api/KHR /usr/local/include


FROM ${from}

RUN apt-get update && apt-get install -y --no-install-recommends \
        pkg-config \
        libxau-dev libxau-dev:i386 \
        libxdmcp-dev libxdmcp-dev:i386 \
        libxcb1-dev libxcb1-dev:i386 \
        libxext-dev libxext-dev:i386 \
        libx11-dev libx11-dev:i386 && \
    rm -rf /var/lib/apt/lists/*

COPY --from=khronos /usr/local/include /usr/local/include

COPY gl.pc.x86_64 /usr/local/lib/x86_64-linux-gnu/pkgconfig/gl.pc
COPY egl.pc.x86_64 /usr/local/lib/x86_64-linux-gnu/pkgconfig/egl.pc

COPY gl.pc.i386 /usr/local/lib/i386-linux-gnu/pkgconfig/gl.pc
COPY egl.pc.i386 /usr/local/lib/i386-linux-gnu/pkgconfig/egl.pc
