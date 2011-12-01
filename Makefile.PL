use inc::Module::Install;
name 'Casual-Groonga';
all_from 'lib/Casual-Groonga.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
