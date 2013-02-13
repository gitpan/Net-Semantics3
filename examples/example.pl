#!/usr/bin/perl
use strict;
use warnings;

################################################################################
# Simple test script to showcase use of Net::Semantics3 to interface
# with Semantics3 Products API.
# 
# Quickstart guide: https://semantics3.com/quickstart
# API Documentation: https://semantics3.com/docs
#
# Author: Sivamani VARUN <varun@semantics3.com>
# Copyright (c) 2013 Semantics3 Inc.
#
# The MIT License from http://www.opensource.org/licenses/mit-license.php
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
#################################################################################

use Net::Semantics3::Products;
use Data::Dumper;

my $sem3 = Net::Semantics3::Products->new (
  api_key => 'YOUR_API_KEY',
  api_secret => 'YOUR_API_SECRET',
);

#-- Construct our query

$sem3->add("products","cat_id",4992);
$sem3->add("products","brand","Toshiba");
$sem3->add("products","weight","gte",1000000);
$sem3->add("products","weight","lt",1500000);
$sem3->add("products","sitedetails","name","newegg.com");
$sem3->add("products","sitedetails","latestoffers","currency","USD");
$sem3->add("products","sitedetails","latestoffers","price","gte",100);
$sem3->add("products","sitedetails","latestoffers","sort","name","dsc");
$sem3->add("products","offset",10);
$sem3->add("products","limit",5);

#-- Let's remove a field

$sem3->remove("products1","weight","gte",1000000);

#-- Make the query

my $productsRef = $sem3->get_products();

#-- View the results of the query

print STDERR Dumper( $productsRef );

