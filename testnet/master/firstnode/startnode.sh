#!/bin/bash
/usr/local/bin/buzzcoind &
/usr/local/bin/cpuminer -a sha256d -O buzzcoinrpc:C8vLdpS24IBx8SNqzFSW1eQxWPj5xHYtDFv5n6V6NdRj -o http://localhost:20115
