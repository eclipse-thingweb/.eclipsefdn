local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-thingweb') {
  settings+: {
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Components for making IoT solutions interoperable at scale by leveraging the W3C WoT standards",
    discussion_source_repository: "eclipse-thingweb/thingweb",
    email: "thingweb-dev@eclipse.org",
    has_discussions: true,
    members_can_change_project_visibility: false,
    name: "Eclipse Thingweb™",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Project-level settings, resources and discussions",
      has_discussions: false,
      homepage: "https://thingweb.io",
      topics+: [
        "iot",
        "organization",
        "web"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('thingweb') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Project-level discussions and organizational resources",
      has_discussions: true,
      homepage: "https://thingweb.io",
      topics+: [
        "iot",
        "organization",
        "web"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('node-wot') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Components for building WoT devices or for interacting with them over various IoT protocols",
      web_commit_signoff_required: false,
      has_wiki: false,
      homepage: "https://thingweb.io",
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
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Browser or Node.js based tool for validating and playing with W3C Thing Descriptions",
      has_discussions: true,
      has_wiki: false,
      homepage: "http://plugfest.thingweb.io/playground/",
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Collection of Things that can be used for testing different IoT protocols, security mechanisms and interaction styles",
      homepage: "https://thingweb.io",
      has_wiki: false,
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
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "The website for the thingweb project",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      homepage: "https://thingweb.io",
      has_wiki: false,
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
