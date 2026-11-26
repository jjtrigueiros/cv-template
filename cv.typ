// Example CV. If you set the template up as a package, use instead:
//   #import "@local/cv-template:0.1.0": contact, cv, entry, stack

#import "template.typ": contact, cv, entry, stack

#show: cv.with(
  name: "Jane Doe",
  contacts: (
    contact("linkedin", [janedoe], url: "https://www.linkedin.com/in/janedoe/"),
    contact("github", [janedoe], url: "https://github.com/janedoe"),
    contact("mail", [jane\@example.com], url: "mailto:jane@example.com"),
    contact("location", [City, Country]),
  ),
)

= Work Experience

#entry(
  title: "Senior Software Engineer",
  org: "Example Corp",
  date: "Jan. 2023 – Present",
)[
  - Designed and maintained internal APIs used by a dozen product teams #stack[Python (FastAPI, Pydantic), PostgreSQL]
  - Reduced CI pipeline duration by 40% through caching and test sharding #stack[GitHub Actions, Docker]
  - Mentored two junior engineers through onboarding and their first projects
]

#entry(
  title: "Software Engineer",
  org: "Sample Startup",
  date: "Jun. 2020 – Dec. 2022",
)[
  - Built data ingestion pipelines processing millions of events per day #stack[Go, Kafka, Kubernetes]
  - Introduced infrastructure as code for all production environments #stack[Terraform, AWS]
]

= Education

#entry(
  title: "MSc in Computer Science",
  org: "Example University",
  date: "Sep. 2018 – Jun. 2020",
)[
  - Thesis on distributed consensus algorithms #stack[Rust]
]

= Other skills

*Languages:* English – Native speaker | Spanish – Intermediate (B1) \
*Volunteering:* organized monthly meetups for a local programming community
