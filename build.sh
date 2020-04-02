#!/bin/bash

cd /build; git clone https://github.com/cloudstateio/cloudstate.git
cd /build/cloudstate

sbt --version
sbt clean && sbt tck/it:test #& rm -rf /build/cloudstate

