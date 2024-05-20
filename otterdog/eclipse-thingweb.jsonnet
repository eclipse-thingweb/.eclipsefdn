local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-thingweb') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Components for making IoT solutions interoperable at scale by leveraging the W3C WoT standards",
    discussion_source_repository: "eclipse-thingweb/thingweb",
    email: "thingweb-dev@eclipse.org",
    has_discussions: true,
    name: "Eclipse Thingweb™",
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Project-level settings, resources and discussions",
      homepage: "https://thingweb.io",
      topics+: [
        "iot",
        "organization",
        "web",
        "web-of-things",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('dart_wot') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      description: "A W3C Web of Things implementation written in Dart.",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "coap",
        "dart",
        "flutter",
        "internetofthings",
        "iot",
        "web-of-things",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('CODECOV_TOKEN') {
          value: "pass:bots/iot.thingweb/codecov.io/codecov-token",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          required_status_checks+: [
            "build (macos-latest)",
            "build (ubuntu-latest)",
            "build (windows-latest)"
          ],
          requires_pull_request: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('domus-tdd-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('node-red') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Collection of Node-RED packages of Eclipse Thingweb",
      has_wiki: false,
      homepage: "https://thingweb.io",
      topics+: [
        "iot",
        "node-red",
        "protocols",
        "web-of-things",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('node-wot') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Components for building WoT devices or for interacting with them over various IoT protocols",
      has_wiki: false,
      homepage: "https://thingweb.io",
      topics+: [
        "iot",
        "nodejs",
        "web",
        "web-of-things",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          bypass_pull_request_allowances+: [
            "@danielpeintner",
            "@relu91"
          ],
          required_approving_review_count: 1,
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
        "nodejs",
        "web",
        "web-of-things",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('td-tools') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Tooling for Thing Descriptions and Thing Models",
      has_wiki: false,
      homepage: "https://thingweb.io",
      topics+: [
        "iot",
        "protocols",
        "testing",
        "web",
        "web-of-things"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('test-things') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Collection of Things that can be used for testing different IoT protocols, security mechanisms and interaction styles",
      has_wiki: false,
      homepage: "https://thingweb.io",
      topics+: [
        "iot",
        "protocols",
        "testing",
        "web-of-things",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
        "web",
        "web-of-things",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Homepage for Eclipse Thingweb, thingweb.io",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_wiki: false,
      homepage: "https://thingweb.io",
      topics+: [
        "iot",
        "web",
        "web-of-things",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
