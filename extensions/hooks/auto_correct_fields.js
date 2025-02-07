module.exports = ({ filter }) => {
  function toSnakeCase(str) {
    return str
      .replace(/([a-z])([A-Z])/g, "$1_$2") // Convert camelCase to snake_case
      .replace(/\s+/g, "_") // Replace spaces with underscores
      .replace(/[^\w]/g, "_") // Replace special characters with underscores
      .toLowerCase();
  }

  filter("items.create", async (payload, { collection }) => {
    if (collection === "companies") {  // Change to your collection name
      let transformed = {};
      for (let key in payload) {
        let newKey = toSnakeCase(key);
        transformed[newKey] = payload[key] ?? null; // Ensure null values persist
      }
      console.log("Transformed Payload:", transformed);
      return transformed;
    }
    return payload;
  });

  filter("items.update", async (payload, { collection }) => {
    if (collection === "companies") {  // Change to your collection name
      let transformed = {};
      for (let key in payload) {
        let newKey = toSnakeCase(key);
        transformed[newKey] = payload[key] ?? null;
      }
      console.log("Updated Payload:", transformed);
      return transformed;
    }
    return payload;
  });
};

