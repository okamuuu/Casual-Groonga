use inc::Module::Install;
name 'Casual-Groonga';
all_from 'lib/Casual-Groonga.pm';

requires 'JSON';
requires 'Capture::Tiny' => 0.13;

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
test_requires 'Test::TCP';
test_requires 'Test::Groonga';
auto_set_repository;
auto_include;
WriteAll;
