#!/bin/sh
newwanip=`wget http://ipecho.net/plain -q -O -`
key="SCU43428Tc83dead8e10154baa6820305a9c851075c4d837016307"
title="IP"
date=`date +%Y-%m-%d`
time=`date +%H:%M:%S`
content="
${date}
${time}
${newwanip}"
curl "http://sc.ftqq.com/${key}.send?text=${title}" -d "&desp=${content}"
