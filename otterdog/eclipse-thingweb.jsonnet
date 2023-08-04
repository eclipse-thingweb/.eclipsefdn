local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-thingweb') {
  settings+: {
    default_repository_permission: "none",
    default_workflow_permissions: "write",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Components for making IoT solutions interoperable at scale by leveraging the W3C WoT standards, no matter if improving an existing solution or building a new one",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: true,
    members_can_delete_repositories: true,
    name: "Eclipse Thingweb\u2122",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    has_discussions: true,
    discussion_source_repository: ".github",
    email: "thingweb-dev@eclipse.org",
  },
  _repositories+:: [
    orgs.newRepo('.github') {
      dependabot_security_updates_enabled: false,
      description: "Project-level settings, resources and discussions",
      has_discussions: false,
      homepage: "https://thingweb.io",
      topics+: [
        "iot",
        "web",
        "organization"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('node-wot') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Components for building WoT devices or for interacting with them over various IoT protocols",
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
      description: "Collection of Things that can be used for testing different IoT protocols, security mechanisms and interaction styles",
      homepage: "http://thingweb.io",
      topics+: [
        "internet-of-things",
        "iot",
        "protocols",
        "testing",
        "web-of-things"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('website') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "The website for the thingweb project",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
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
