local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('iot.thingweb', 'eclipse-thingweb') {
  settings+: {
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
      description: "Framework to build Web of Things applications in Dart and Flutter.",
      homepage: "https://thingweb.io",
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
        orgs.newRepoSecret('BOT_TOKEN') {
          value: "pass:bots/iot.thingweb/github.com/project-token",
        },
        orgs.newRepoSecret('CODECOV_TOKEN') {
          value: "pass:bots/iot.thingweb/codecov.io/codecov-token",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          required_status_checks+: [
            "build (macos-latest)",
            "build (ubuntu-latest)",
            "build (windows-latest)"
          ],
          requires_pull_request: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('examples') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Example combinations of Thingweb components that have been tested at various events.",
      has_discussions: false,
      homepage: "https://thingweb.io",
      topics+: [
        "coap",
        "http",
        "iot",
        "organization",
        "modbus",
        "mqtt",
        "web",
        "web-of-things",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('domus-tdd-api') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Semantic storage for device metadata based on W3C Thing Description information model",
      homepage: "https://thingweb.io",
      topics+: [
        "iot",
        "organization",
        "web",
        "web-of-things",
        "wot",
        "python",
        "semantic-web",
        "microservice"
      ],
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      secrets: [
        orgs.newRepoSecret('CODECOV_TOKEN') {
          value: "pass:bots/iot.thingweb/codecov.io/domus-tdd-api-token",
        },
      ],
    },
    orgs.newRepo('infrastructure') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Main infrastructure configuration of the server to manage the deployment of vserver.",
      has_discussions: false,
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
    orgs.newRepo('kotlin-wot') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "A Framework for implementing Web of Things in Kotlin",
      has_wiki: false,
      homepage: "",
      topics+: [
        "ai",
        "iot",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      rulesets: [
        orgs.newRepoRuleset('Main Protection') {
          allows_creations: true,
          include_refs+: [
            "~DEFAULT_BRANCH"
          ],
        },
      ],
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
      secrets: [
        orgs.newRepoSecret('CODECOV_TOKEN') {
          value: "pass:bots/iot.thingweb/codecov.io/node-red-token",
        },
      ],
    },
    orgs.newRepo('node-wot') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "A fast and extensible framework to connect any device with your browser and backend applications",
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
      description: "Browser application for validating and designing W3C Thing Descriptions and Thing Models.",
      has_discussions: true,
      has_wiki: false,
      homepage: "https://playground.thingweb.io/",
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
      secrets: [
        orgs.newRepoSecret('CODECOV_TOKEN') {
          value: "pass:bots/iot.thingweb/codecov.io/playground-token",
        },
      ],
    },
    orgs.newRepo('td-tools') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Utility libraries for W3C Thing Descriptions and Thing Models",
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
      secrets: [
        orgs.newRepoSecret('CODECOV_TOKEN') {
          value: "pass:bots/iot.thingweb/codecov.io/td-tools-token",
        },
      ],
    },
    orgs.newRepo('td-code') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "VS Code extension for validating and designing W3C Thing Descriptions and Thing Models.", 
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
    orgs.newRepo('wam') {
      allow_merge_commit: true,
      allow_update_branch: false,
      forked_repository: "UniBO-PRISMLab/wam",
      fork_default_branch_only: true,
      default_branch: "master",
      description: "WoT Application Manager - a CLI to quickly build a Web of Things application.",
      homepage: "https://thingweb.io",
      has_wiki: false,
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
    orgs.newRepo('website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Homepage for Eclipse Thingweb, thingweb.io",
      gh_pages_build_type: "workflow",
      has_discussions: true,
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
