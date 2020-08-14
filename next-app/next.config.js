// next.config.js
module.exports = {
  distDir: 'output',
  generateBuildId: async () => {
    return process.env.NEXT_BUILD_ID || 'next-build'
  },
}
