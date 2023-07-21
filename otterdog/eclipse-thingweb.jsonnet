local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-thingweb') {
  settings+: {
    default_repository_permission: "none",
    default_workflow_permissions: "write",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: true,
    members_can_create_teams: true,
    members_can_delete_repositories: true,
    name: "Eclipse Thingweb\u2122",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
  },
  _repositories+:: [
    orgs.newRepo('node-wot') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "thingweb.node-wot",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('playground') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Browser or Node.js based tool for validating and playing with W3C Thing Descriptions",
      has_discussions: true,
      homepage: "http://plugfest.thingweb.io/playground/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "iot",
        "web"
      ],
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SSH_HOST') {
          value: "********",
        },
        orgs.newRepoSecret('SSH_PASS') {
          value: "********",
        },
        orgs.newRepoSecret('TD_PLAYGROUND_LOGIN') {
          value: "********",
        },
        orgs.newRepoSecret('TD_PLAYGROUND_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('test-things') {
      allow_update_branch: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('website') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "The website for the thingweb project",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages",
            "master"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
