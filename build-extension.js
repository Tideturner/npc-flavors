#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const AdmZip = require("adm-zip");

// Configuration
const EXTENSION_XML = "extension.xml";
const OUTPUT_FILENAME = "npc-flavors.ext";

/**
 * Parses the extension.xml file using regex (no XML parser needed)
 */
function parseExtensionXml(xmlPath) {
  const xmlContent = fs.readFileSync(xmlPath, "utf8");

  // Extract version using regex
  const versionMatch = xmlContent.match(/<version>(.*?)<\/version>/);
  const version = versionMatch ? versionMatch[1].trim() : "0.0.0";

  // Collect all file references
  const files = new Set();

  // Add the extension.xml itself
  files.add(EXTENSION_XML);

  // Extract files from <includefile source="..."> tags
  const includeMatches = xmlContent.matchAll(/includefile\s+source="([^"]+)"/g);
  for (const match of includeMatches) {
    files.add(match[1]);
  }

  // Extract files from <script file="..."> tags
  const scriptMatches = xmlContent.matchAll(/script\s+[^>]*file="([^"]+)"/g);
  for (const match of scriptMatches) {
    files.add(match[1]);
  }

  // Extract files from <icon file="..."> tags
  const iconMatches = xmlContent.matchAll(/icon\s+[^>]*file="([^"]+)"/g);
  for (const match of iconMatches) {
    files.add(match[1]);
  }

  return {
    version,
    files: Array.from(files),
  };
}

/**
 * Creates the output directory if it doesn't exist
 */
function ensureDirectory(dirPath) {
  if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath, { recursive: true });
    console.log(`Created directory: ${dirPath}`);
  }
}

/**
 * Creates a zip archive with all extension files
 */
function createExtensionPackage(files, outputPath) {
  const zip = new AdmZip();

  let addedCount = 0;
  let skippedCount = 0;

  files.forEach((file) => {
    const filePath = path.join(__dirname, file);

    if (fs.existsSync(filePath)) {
      // Add file with its original path structure
      zip.addLocalFile(filePath, path.dirname(file));
      console.log(`  ✓ ${file}`);
      addedCount++;
    } else {
      console.warn(`  ✗ File not found: ${file}`);
      skippedCount++;
    }
  });

  console.log(`\nAdded ${addedCount} files, skipped ${skippedCount} missing files`);

  // Write the zip file
  zip.writeZip(outputPath);

  const stats = fs.statSync(outputPath);
  console.log(`\nPackage created: ${outputPath}`);
  console.log(`Total size: ${(stats.size / 1024).toFixed(2)} KB`);
}

/**
 * Main build function
 */
function build() {
  try {
    console.log("NPC Flavors Extension Builder");
    console.log("=============================\n");

    // Parse extension.xml
    console.log("Parsing extension.xml...");
    const { version, files } = parseExtensionXml(EXTENSION_XML);
    console.log(`Version: ${version}`);
    console.log(`Files to include: ${files.length}\n`);

    // Create output directory
    const outputDir = path.join("build", "releases", version);
    ensureDirectory(outputDir);

    // Create the package
    const outputPath = path.join(outputDir, OUTPUT_FILENAME);
    console.log("Creating extension package...\n");
    createExtensionPackage(files, outputPath);

    console.log("\n✓ Build completed successfully!");
    console.log(`Output: ${outputPath}`);
  } catch (error) {
    console.error("\n✗ Build failed:", error.message);
    process.exit(1);
  }
}

// Run the build
build();
