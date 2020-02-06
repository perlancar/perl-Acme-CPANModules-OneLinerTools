package Acme::CPANModules::OneLinerTools;

# AUTHORITY
# DATE
# DIST
# VERSION

our $LIST = {
    summary => 'Modules to make your life easier when writing perl one-liners',
    description => <<'_',
_
    entries => [

        {
            module => 'L',
            description => <<'_',

One of the "module autoloader" modules, which happens to have a short name for
one-liner usage. So instead of having to type this:

    % perl -MOrg::Parser::Tiny -E'$doc = Org::Parser::Tiny->new->parse_file("/home/budi/todo.org"); ...'

you can now write:

    % perl -ML -E'$doc = Org::Parser::Tiny->new->parse_file("/home/budi/todo.org"); ...'

"Module autoloader" modules work using Perl's autoloading mechanism (read
`perlsub` for more details). By declaring a subroutine named `AUTOLOAD` in the
`UNIVERSAL` package, you setup a fallback mechanism when you call an undefined
subroutine. <pm:L>'s AUTOLOADER loads the module using <pm:Module::Load> then
try to invoke the undefined subroutine once again.

_
            tags => ['module'],
        },

        {
            module => 'lib::xi',
            description => <<'_',

This module can automatically install missing module during run-time using
`cpanm`. Convenient when running a Perl script (that comes without a proper
distribution or `cpanfile`) that uses several modules which you might not have.
The alternative to lib::xi is the "trial and error" method: repeatedly run the
Perl script to see which module it tries and fails to load.

lib::xi works by installing a hook in `@INC`.

_
            tags => ['module'],
            alternate_modules => [
                'Require::Hook::More', # the autoinstalling feature has not been implemented though
            ],
        },

        {
            module => 'Log::Any::App',
            description => <<'_',

A convenient way to display (consume) logs if your application uses
<pm:Log::Any> to produce logs.

_
            tags => ['logging'],
        },

        {
            module => 'Log::ger::App',
            description => <<'_',

A convenient way to display (consume) logs if your application uses
<pm:Log::ger> to produce logs.

_
            tags => ['logging'],
        },

        {
            modules => 'DD::Dummy',
            description => <<'_',

My preference when dumping data structure when debugging Perl application is,
well, Perl format (unlike some others which prefer custom format like
<pm:Data::Printer>). The DD-Dummy distribution provides <pm:DD> module, which in
turn exports `dd` to dump your data structures for debugging using
<pm:Data::Dump>. Another good alternative is <pm:XXX> which by default uses YAML
output but can be changed with this environment variable setting:

    PERL_XXX_DUMPER=Data::Dump

_
            alternate_modules => ['XXX', 'Data::Printer'],
            tags => ['debugging'],
        },

        {
            module => 'Devel::Confess',
            description => <<'_',

Forces stack trace when your application warns or dies. Used with the perl's
`-d` flag:

    % perl -d:Confess ...
    % perl -d:Confess=dump ...

_
            tags => ['debugging'],
        },

        {
            module => 'DBIx::Conn::MySQL',
            description => <<'_',

Shortcut when connecting to MySQL database in your one-liner. Instead of:

    % perl -MDBI -E'my $dbh = DBI->connect("dbi:mysql:database=mydb", "someuser", "somepass"); $dbh->selectrow_array("query"); ...'

you can type:

    % perl -MDBIx::Conn::MySQL=mydb -E'$dbh->selectrow_array("query"); ...'

_
            tags => ['database', 'dbi'],
        },

        {
            module => 'DBIx::Conn::SQLite',
            description => <<'_',

Shortcut when connecting to MySQL database in your one-liner. Instead of:

    % perl -MDBI -E'my $dbh = DBI->connect("dbi:SQLite:dbname=mydb", "", ""); $dbh->selectrow_array("query"); ...'

you can type:

    % perl -MDBIx::Conn::SQLite=mydb -E'$dbh->selectrow_array("query"); ...'

_
            tags => ['database', 'dbi'],
        },

    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO

L<Acme::CPANModules::OneLetter>

L<Acme::CPANModules::DebugDumping>
