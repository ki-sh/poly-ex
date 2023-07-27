# poly-ex

Example of an approach to poly repo setup utilising 
 
 * package.json and package.hoist.json configuration
 * yarn workspaces
 * git
 * kish

## Intro

The approach is to fork this repo, configure config.repos and config.dirs in package.json to your repos and their locations to checkout to. You can have different tasks for different teams, as shown her we have clone:all / clone:frontend / clone:serverside. So subsets of the repos may be used by different teams/other organisational reasons.

```
My_Poly_Repo
    package.json #yarn workspace configured, symlinked to poly-ex/package.hoist.json
    |-apps
        |-acme
        |-wayne-ind
        |-wakanda
    |-packages
        |-auth_service
        |-api_service
        |-ui_components
```

The top level package.json is symlinked so it is under source control in your poly-repo. This prevents
sub repo issues with git.
run in top level dir:
`$> yarn install`
This installs any packages for the workspaces specified (apps/* and packages/* in example.)

kish is useful especially for yarn (y/yr) and git operations without having to cd from the top level directory. 

## Hybridization

Say you wanted to migrate to a monorepo, or have a monorepo of all the repos as well as being able to work with its parts divided up into multiple repos, you could:

run clone:all, hoist:workspace, add top level mono-repo source control configuration. This could be git (not really designed for large monorepos) or other version control system. 

For arguments sake, using git, could rename apps/*/.git and packages/*/.git folders to .xgit,
and switch top level mono repo from .xgit to .git to switch between multi and mono operation.

You would need a strict policy that either the multiple repos are written to or the monorepo is only written to, so updates flow in one direction.
I havent found a reason to do anything like this, especially as I believe this poly repo approach gives a lot of the benefits both of mono-repos and multiple-repos in a simple easy poly way.



