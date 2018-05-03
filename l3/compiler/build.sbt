lazy val root = project
  .in(file("."))
  .settings(
  name := "l3c",
  organization := "ch.epfl",
  version := "1.0.0",

  scalaVersion := "2.12.4",
  scalacOptions ++= Seq("-feature",
                        "-deprecation",
                        "-unchecked",
                        "-encoding", "utf-8"),

  // Main configuration
  scalaSource in Compile := baseDirectory.value / "src",
  libraryDependencies += "com.lihaoyi" %% "fastparse" % "1.0.0",
  libraryDependencies += "org.typelevel" %% "paiges-core" % "0.2.0",

  fork in run := true,
  connectInput in run := true,
  outputStrategy in run := Some(StdoutOutput),
  javaOptions in run ++= Seq("-Xss32M", "-Xms128M"),

  // Test configuration
  scalaSource in Test := baseDirectory.value / "test",
  libraryDependencies += "com.novocode" % "junit-interface" % "0.11" % "test",

  testOptions += Tests.Argument(TestFrameworks.JUnit, "-q", "-v"),
  fork in Test := true,
  javaOptions in Test ++= Seq(
    "-Xss32M",
    "-Xms128M",
    "-Djava.security.manager",
    "-Djava.security.policy=" + (baseDirectory.value / "project/tests.policy")))
