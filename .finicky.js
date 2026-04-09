export default {
  defaultBrowser: "Safari",
  handlers: [
    {
      match: (url) => url.hostname.includes("youtube.com") || url.hostname.includes("youtu.be"),
      browser: "Firefox",
    },
    {
      match: "https://www.figma.com/file/*",
      browser: "Figma",
    },
    {
      match: "https://linear.app/*",
      browser: "Linear",
    },
    {
      match: "https://d-9267aae176.awsapps.com/start/*",
      browser: {
        name: "Google Chrome",
        args: ["--profile-directory=Profile 1"]
      }
    },
    {
      match: (url) => /^www\.pr-.*\.staging\.loanos\.net$/.test(url.hostname),
      browser: {
        name: "Google Chrome",
        args: ["--profile-directory=Profile 1"]
      }
    }
  ]
}
